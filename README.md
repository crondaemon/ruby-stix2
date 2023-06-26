# ruby-stix2
Ruby implementation for the STIX protocol version 2

# Installation

Install the gem as standalone

```
gem install ruby-stix2
```

or as part of the bundle

```
bundle add ruby-stix2
```

# Usage

The gem implements the Stix2 v2.1 specifications: https://docs.oasis-open.org/cti/stix/v2.1/stix-v2.1.html. Every object
is under the Stix2 namespace, and under a more specific namespace.

Example

```ruby
Stix2::DomainObject::Indicator.new(
  type: 'indicator',
  id: 'file--1389b98d-a3d3-5190-a996-716fd444059a',
  description: 'description',
  indicator_types: ['anomalous-activity', 'anonymization'],
  pattern: 'pattern',
  pattern_type: 'yara',
  pattern_version: 1,
  valid_from: Time.now,
  valid_until: Time.now,
  kill_chain_phases: [
    {
      kill_chain_name: "lockheed-martin-cyber-kill-chain",
      phase_name: "reconnaissance"
    },
    {
      kill_chain_name: "foo",
      phase_name: "pre-attack"
    }
  ]
)
```

The real objects can be created just starting from properties. However a `Stix2.parse` complimentary function is provided. This function gives the user few advantages, listed below.

## Parse input

The function accept a `Hash` (containing the attributes), a string (containing a JSON, on which `JSON.parse` is
executed). If the input is not hash or string, the function tries to run `to_s` on the object and then JSON.parse.

```ruby
Stix2.parse(type: 'indicator')
Stix2.parse('type' => 'indicator')
Stix2.parse('{"type":"indicator"}')
Stix2.parse(MyObject.new(...))
```

## Return

The function infers the `type` attribute of the input and determines which is the proper instance to create. This 
results in a fancy way of processing Stix2 input: basically give whatever you have to it and you will get the proper
Stix2 message.

# Storage

The Stix2 standard has several object types, some of which are containers of other objects (like `Bundle`). However we
may want to save and retrieve Stix2 objects in a fast way. The gem provides a `Stix::Storage` support for that.

For any Stix2 attribute that is an `identifier` (`Stix2::Identifier` in the gem) the class gives one more method called
`_instance` to retrieve the actual instance. If we have a `threat-actor` like this

```json
{
  "type": "threat-actor",
  "spec_version": "2.1",
  "id": "threat-actor--8e2e2d2b-17d4-4cbf-938f-98ee46b3cd3f",
  "created_by_ref": "identity--f431f809-377b-45e0-aa1c-6a4751cae5ff",
  "created": "2016-04-06T20:03:48.000Z",
  "modified": "2016-04-06T20:03:48.000Z",
  "threat_actor_types": ["crime-syndicate"],
  "name": "Evil Org",
  "description": "The Evil Org threat actor group",
  "aliases": ["Syndicate 1", "Evil Syndicate 99"],
  "roles": ["director"],
  "goals": ["Steal bank money", "Steal credit cards"],
  "sophistication": "advanced",
  "resource_level": "team",
  "primary_motivation": "organizational-gain"
}
```

we know that this object has been created by an identity `identity--f431f809-377b-45e0-aa1c-6a4751cae5ff`. We can
retrieve the other object if already seen

```ruby
Stix2::Storage.activate # Activate the storage

identity = Stix2::DomainObject::Identity.new(id: 'identity--f431f809-377b-45e0-aa1c-6a4751cae5ff', ...)
threat_actor = Stix2::DomainObject::ThreatActor.new(created_by_ref: 'identity--f431f809-377b-45e0-aa1c-6a4751cae5ff', ...)

threat_actor.created_by_ref # this gives the identifier => identity--f431f809-377b-45e0-aa1c-6a4751cae5ff
threat_actor.created_by_ref_instance # this gives the actual object => Stix2::DomainObject::Identity
```

# Spec versions

This gem implements the spec version `2.1`. However older version (especially 2.0) can be compatible. To force the gem
to accept another spec version, just add them to the `SPEC_VERSIONS` variable.

```ruby
Stix2::SPEC_VERSIONS << '2.0'
```

# Custom Definitions

The Stix2 standard includes several extensions to base objects. All extensions are widely described in the standard 
itself, please refer to it. However two of them need more attention for how they are implemented in this gem.

## Extension Definition

This object allows the definition of new properties. One special property is `toplevel-property-extension` that allows
the definition of properties on the top-level of an object. According to the standard thos properties should be
defined solely on the object that is actually using the property. However due to the `hashie`-based implementation
the gem declares the new properties on the class itself. This is a known limitation of the current implementation and
it may be fixed in the future.

## Custom Object

A `CustomObject` can also be used within the Gem. The standard defines the rules that must be fulfilled for a custom
object. Since those rules are several, the code stacks all the errors altogether and raises an exception when some
errors happen. The exception is RuntimeError, that gives the user a string. It is suboptimal to have multiple errors
in a string, and it may be fixed in the future.

# Confidence

A Stix2 object can have the property `confidence` set. This value can be expressed according to several conficence 
scales. To make this conversion smooth, an object offers the method `confidence_scale` that is an instance of
`Stix2::ConfidenceScale`. This class offers method for all the scales the standard includes.

```ruby
indicator = Stix2::DomainObject::Indicator.new(confidence: i)
indicator.confidence # This is the raw integer
indicator.confidence_scale.to_admiralty_credibility # this is a string in this scale
indicator.confidence_scale.to_admiralty_credibility_strix # this is a string in stix mode
```

# Contribution

You can contribute to this project in 2 ways:

- with a PR: just follow the standard github workflow
- by pointing out missing support: open an issue and please provide a json containing the missing support, to simplify
the development

# See also

Ruby Stix2: https://github.com/crondaemon/ruby-taxii2

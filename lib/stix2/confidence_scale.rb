module Stix2
  class ConfidenceScale
    SCALE_NONE_LOW_MED_HIGH = {
      0..0 => {scale: "None", stix: 0},
      1..29 => {scale: "Low", stix: 15},
      30..69 => {scale: "Med", stix: 50},
      70..100 => {scale: "High", stix: 85}
    }.freeze

    SCALE_0_10 = {
      0..4 => {scale: 0, stix: 0},
      5..14 => {scale: 1, stix: 10},
      15..24 => {scale: 2, stix: 20},
      25..34 => {scale: 3, stix: 30},
      35..44 => {scale: 4, stix: 40},
      45..54 => {scale: 5, stix: 50},
      55..64 => {scale: 6, stix: 60},
      65..74 => {scale: 7, stix: 70},
      75..84 => {scale: 8, stix: 80},
      85..94 => {scale: 9, stix: 90},
      95..100 => {scale: 10, stix: 100}
    }.freeze

    SCALE_ADMIRALTY_CREDIBILITY = {
      0..19 => {scale: 5, stix: 10},
      20..39 => {scale: 4, stix: 30},
      40..59 => {scale: 3, stix: 50},
      60..79 => {scale: 2, stix: 70},
      80..100 => {scale: 1, stix: 90}
    }.freeze

    SCALE_WEP = {
      0..0 => {scale: "Impossible", stix: 0},
      1..19 => {scale: "Highly Unlikely/Almost Certainly Not", stix: 10},
      20..39 => {scale: "Unlikely/Probably Not", stix: 30},
      40..59 => {scale: "Even Chance", stix: 50},
      60..79 => {scale: "Likely/Probable", stix: 70},
      80..99 => {scale: "Highly likely/Almost Certain", stix: 90},
      100..100 => {scale: "Certain", stix: 100}
    }.freeze

    SCALE_DNI = {
      0..9 => {scale: "Almost No Chance / Remote", stix: 5},
      10..19 => {scale: "Very Unlikely / Highly Improbable", stix: 15},
      20..39 => {scale: "Unlikely / Improbable", stix: 30},
      40..59 => {scale: "Roughly Even Chance / Roughly Even Odds", stix: 50},
      60..79 => {scale: "Likely / Probable", stix: 70},
      80..89 => {scale: "Very Likely / Highly Probable", stix: 85},
      90..100 => {scale: "Almost Certain / Nearly Certain", stix: 95}
    }.freeze

    def initialize(value = nil)
      @value = value
    end

    def to_none_low_med_high
      !@value && "Not Specified"
      find_range(SCALE_NONE_LOW_MED_HIGH, :scale)
    end

    def to_none_low_med_high_stix
      !@value && "Not Specified"
      find_range(SCALE_NONE_LOW_MED_HIGH, :stix)
    end

    def to_0_10
      !@value && 6
      find_range(SCALE_0_10, :scale)
    end

    def to_0_10_stix
      find_range(SCALE_0_10, :stix)
    end

    def to_admiralty_credibility
      find_range(SCALE_ADMIRALTY_CREDIBILITY, :scale)
    end

    def to_admiralty_credibility_stix
      find_range(SCALE_ADMIRALTY_CREDIBILITY, :stix)
    end

    def to_wep
      find_range(SCALE_WEP, :scale)
    end

    def to_wep_stix
      find_range(SCALE_WEP, :stix)
    end

    def to_dni_scale
      find_range(SCALE_DNI, :scale)
    end

    def to_dni_scale_stix
      find_range(SCALE_DNI, :stix)
    end

    private

    def find_range(constant, type)
      !@value || "Not Specified"
      constant.find { |k, v| k.cover?(@value) }.last[type]
    end
  end
end

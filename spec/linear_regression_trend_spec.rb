require 'spec_helper'

describe LinearRegressionTrend::Calculator do
  it 'has a version number' do
    expect(LinearRegressionTrend::VERSION).not_to be nil
  end

  context "for simple and linear data sets" do
    let(:known_ys) { [10, 14, 18, 22, 26] }
    subject        { described_class.new(known_ys) }

    it 'calculates the slope' do
      expect(subject.slope).to eq 4
    end

    it "calculates the intercept" do
      expect(subject.intercept).to eq 6
    end
  end

  context "for simple and non-linear data sets" do
    context "that have a descending trend" do
      let(:known_ys) { [1, 2, 3, 6, 10, 11, 12, 12, 12, 12, 15, 18, 18, 16, 16, 15, 14, 11, 9, 9, 7, 4, 2, 1, 1] }
      subject        { described_class.new(known_ys) }

      it 'calculates the slope and intercept' do
        expect(subject.slope).to     eq -0.06384615384615384
        expect(subject.intercept).to eq 10.31
      end

      it "calculates a descending trend" do
        expect(subject.trend.first).to be > subject.trend[-1]
      end
    end

    context "that have an ascending trend" do
      let(:known_ys) { [1, 2, 3, 6, 10, 11, 12, 12, 12, 12, 15, 18, 18, 16, 16, 15, 14, 11, 9, 9, 7, 4, 2, 1, 1].reverse }
      subject        { described_class.new(known_ys) }

      it 'calculates the slope and intercept' do
        expect(subject.slope).to     eq 0.06384615384615384
        expect(subject.intercept).to eq 8.65
      end

      it "calculates an ascending trend" do
        expect(subject.trend.first).to be < subject.trend[-1]
      end
    end
  end

  context "for non-negative trends" do
    let(:known_ys) { [1,2,3,0,10,18,18,18,1,1,1,1,0.5,0.5,0.5,0.5,05,0.25,0.25,0.1,0.1,0,0,0,0] }
    subject        { described_class.new(known_ys, non_negative: true) }

    it "should stop at 0 for descending trends" do
      expect(subject.slope).to eq -0.3467307692307691

      [24, 23, 22].each do |zeroed_trend_point|
        expect(subject.trend[zeroed_trend_point]).to eq 0
      end

      expect(subject.trend[21]).to be > 0
    end
  end

  context "when forecasting values" do
    context "when trending upward" do
      subject        { described_class.new(known_ys) }
      let(:known_ys) { [10, 14, 18, 22, 26] }

      it "is expected to provide forecasted values" do
        expect(subject.forecast_next(5)).to eq [30.0, 34.0, 38.0, 42.0, 46.0]
      end
    end

    context "when trending downward" do
      let(:known_ys) { [1,2,3,0,10,18,18,18,1,1,1,1,0.5,0.5,0.5,0.5,05,0.25,0.25,0.1,0.1,0,0,0,0] }

      it "should trend correctly" do
        subject = described_class.new(known_ys)

        expect(subject.forecast_next(5)).to eq [-1.2394999999999996, -1.5862307692307684, -1.9329615384615373, -2.279692307692308, -2.6264230769230767]
      end

      it "should stop at 0 if non negative trends are requested" do
        subject = described_class.new(known_ys, non_negative: true)

        expect(subject.forecast_next(5)).to eq [0, 0, 0, 0, 0]
      end
    end
  end
end

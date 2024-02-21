# frozen_string_literal: true

RSpec.describe PgnYamlConverter::Converter do
  it "「Converter」という class が存在すること" do
    expect(described_class).to be_a(Object)
  end

  it "「Converter61cdb610c」という class が存在しないこと" do
    expect { Converter61cdb610c }.to raise_error NameError
  end

  context "with pgn2yaml" do
    before do
      @conv = described_class.new
    end

    it "sample.pgn を読み込んだ出力1行目が Event:…" do
      @conv.pgn2yaml("spec/pgn_yaml_converter/sample.pgn")
      expect(@conv.output[0]).to eq "Event: F/S Return Match"
    end
  end

  context "with yaml2pgn" do
    before do
      @conv = described_class.new
    end

    it "sample.pgn を読み込んだ出力1行目が Event:…" do
      @conv.yaml2pgn("spec/pgn_yaml_converter/sample.yaml")
      expect(@conv.output[0]).to eq '[Event "F/S Return Match"]'
    end
  end
end

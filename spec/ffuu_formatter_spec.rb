require "ffuu_formatter"

RSpec.describe "rspec_ffuu_formatter" do
  let(:output) { StringIO.new }
  let(:formatter) { FfuuFormatter.new(output) }

  it "prints periods as long as all tests pass" do
    3.times { formatter.example_passed({}) }
    expect(output.string).to eq("...")
  end

  it "prints failures as 'F'" do
    3.times { formatter.example_passed({}) }
    formatter.example_failed({})
    expect(output.string).to eq("...F")
  end

  it "prints success as 'U' after initial failure" do
    2.times { formatter.example_failed({}) }
    3.times { formatter.example_passed({}) }
    expect(output.string).to eq("FFUUU")
  end

  it "prints pending tests as '*'" do
    formatter.example_pending({})
    expect(output.string).to eq("*")
  end
end

RSpec.describe Coconductor::Matchers::Exact do
  let(:filename) { 'CODE_OF_CONDUCT.txt' }
  let(:cc_1_4) do
    Coconductor::CodeOfConduct.find('contributor-covenant/version/1/4')
  end
  let(:content) { cc_1_4.content }
  let(:file) do
    Coconductor::ProjectFiles::CodeOfConductFile.new(content, filename)
  end

  subject { described_class.new(file) }

  it 'stores the file' do
    expect(subject.file).to eql(file)
  end

  it 'matches' do
    expect(subject.match).to eql(cc_1_4)
  end

  it 'is confident' do
    expect(subject.confidence).to eql(100)
  end

  context 'with words added' do
    let(:content) { cc_1_4.content + 'foo' }

    it "doesn't match" do
      expect(subject.match).to be_nil
    end
  end
end

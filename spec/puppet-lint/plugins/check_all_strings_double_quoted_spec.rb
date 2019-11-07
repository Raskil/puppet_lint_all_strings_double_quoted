require 'spec_helper'

describe 'all_strings_double_quoted' do

  context 'with fix disabled' do
    context 'string double quoted' do
      let(:code) { '$test = "blah"' }

      it 'should not detect any problems' do
        expect(problems).to have(0).problems
      end
    end
    context 'string not double quoted' do
      let(:code) { "$test = 'blah'" }

      it 'should only detect a single problem' do
        expect(problems).to have(1).problem
      end
    end

    context 'string not double quoted but escape sequence' do
      let(:code) { "$test = '${blah}'" }

      it 'should not detect any problems' do
        expect(problems).to have(0).problem
      end
    end

    context 'string not double quoted but escape sequence 2' do
      let(:code) { "$test = '$blah'" }

      it 'should not detect any problems' do
        expect(problems).to have(0).problem
      end
    end

    context 'string not double quoted but escape sequence backslash' do
      let(:code) { "$test = 'test\\blubb'" }

      it 'should not detect any problems' do
        expect(problems).to have(0).problem
      end
    end

    context 'string not double quoted but doublequote' do
      let(:code) { "$test = 'test\"blubb'" }

      it 'should not detect any problems' do
        expect(problems).to have(0).problem
      end
    end
  end

  context 'with fix enabled' do
    before do
      PuppetLint.configuration.fix = true
    end

    after do
      PuppetLint.configuration.fix = false
    end

    context 'string not double quoted' do
      let(:code) { "$test = 'blah'" }

      it 'should fix the manifest' do
        expect(problems).to contain_fixed('string not double quoted.').on_line(1).in_column(9)
      end

      it 'should convert the double quoted string into single quotes' do
        expect(manifest).to eq('$test = "blah"')
      end
    end
    context 'string not double quoted but escape sequence' do
      let(:code) { "$test = '${blah}'" }

      it 'should not detect any problems' do
        expect(problems).to have(0).problem
      end
      it 'should not modify the manifest' do
        expect(manifest).to eq(code)
      end
    end

    context 'string not double quoted but escape sequence 2' do
      let(:code) { "$test = '$blah'" }

      it 'should not detect any problems' do
        expect(problems).to have(0).problem
      end
      it 'should not modify the manifest' do
        expect(manifest).to eq(code)
      end
    end

    context 'string not double quoted but escape sequence backslash' do
      let(:code) { "$test = 'test\\blubb'" }

      it 'should not detect any problems' do
        expect(problems).to have(0).problem
      end
      it 'should not modify the manifest' do
        expect(manifest).to eq(code)
      end
    end

    context 'string not double quoted but doublequote' do
      let(:code) { "$test = 'test\"blubb'" }

      it 'should not detect any problems' do
        expect(problems).to have(0).problem
      end
      it 'should not modify the manifest' do
        expect(manifest).to eq(code)
      end
    end
  end

end

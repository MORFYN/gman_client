require 'spec_helper'
require 'gman_client'
require 'vcr'
require 'httparty'
require 'webmock'
require 'support/vcr'

RSpec.describe GmanClient do
  describe '.receive_drivers' do
    VCR.use_cassette('drivers') do
      response = GmanClient.receive_drivers
      subject(:driver_response) { response }
      let(:driver) { driver_response.first }

      it 'empty is not false' do
        expect(driver_response.empty?).to be_falsey
      end
      describe 'first driver' do
        subject { driver_response.first }

        it { is_expected.to have_key(:driver_id) }
        it { is_expected.to have_key(:first_name) }
        it { is_expected.to have_key(:last_name) }
      end
    end
  end
end

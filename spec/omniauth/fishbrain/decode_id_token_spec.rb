# frozen_string_literal: true

require 'spec_helper'
require 'omniauth/fishbrain/decode_id_token'
require 'timecop'

describe OmniAuth::Fishbrain::DecodeIdToken do
  describe 'decode' do
    let(:token) do
      <<~TOKEN.gsub(/\s+/, '')
        eyJraWQiOiJVcHp3Q2c0T0NNREtyXC92VUxWYnNqTFowR2FYVFBFait4OTZZamR4THlIWT0iLCJhbGciOiJSUzI1NiJ
        9.eyJhdF9oYXNoIjoiVjd4YkVSUml0akw0OU44UmVKcDBkQSIsInByZW1pdW1fc3RhdHVzIjoie1wiZW5kX2RhdGVcI
        jpcIjIwMjAtMDktMThUMTI6NDc6NTAuMDAwWlwifSIsInN1YiI6ImI3Y2IwOGRhLWM1MzktNDE1NS1iZWQxLWVmNzhj
        Yjc0NjNiMCIsInpvbmVpbmZvIjoiRXVyb3BlXC9TdG9ja2hvbG0iLCJlbWFpbF92ZXJpZmllZCI6dHJ1ZSwiaXNzIjo
        iaHR0cHM6XC9cL2NvZ25pdG8taWRwLmV1LXdlc3QtMS5hbWF6b25hd3MuY29tXC9ldS13ZXN0LTFfV2xCaGJ1RDZlIi
        wiY3VzdG9tOnVzZXJfaWQiOiIxOTEwMiIsInBob25lX251bWJlcl92ZXJpZmllZCI6ZmFsc2UsImNvZ25pdG86dXNlc
        m5hbWUiOiJiN2NiMDhkYS1jNTM5LTQxNTUtYmVkMS1lZjc4Y2I3NDYzYjAiLCJnaXZlbl9uYW1lIjoiVGltIiwibG9j
        YWxlIjoiZW4iLCJhdWQiOiJ0djI2dmFiZm5wbjA5cXZxcHZoMnBocWpkIiwiaWRlbnRpdGllcyI6W3sidXNlcklkIjo
        iMTEwMTA4NzQ3OTkxODI3NTk1MzUxIiwicHJvdmlkZXJOYW1lIjoiR29vZ2xlIiwicHJvdmlkZXJUeXBlIjoiR29vZ2
        xlIiwiaXNzdWVyIjpudWxsLCJwcmltYXJ5IjoiZmFsc2UiLCJkYXRlQ3JlYXRlZCI6IjE1ODU4OTIzNzAyMDEifV0sI
        nRva2VuX3VzZSI6ImlkIiwiYXV0aF90aW1lIjoxNTkzMDAwODAyLCJuYW1lIjoiVGltIEhlaWdoZXMiLCJleHAiOjE1
        OTMwMDQ0MDIsImlhdCI6MTU5MzAwMDgwMiwiZW1haWwiOiJ0aW1oZWlnaGVzQGZpc2hicmFpbi5jb20ifQ.RK_CrJRv
        qpYB9ZYI_NCCeGCiUxKP8a3iIVGq60sph8JL9eeDGJ0W5jXGn-jioUYzNEG5zTdfZYv_ZSPK5W_OMzxhWbrUA2TKH56
        4XT-1CUhDKSt355dsWE2kIxHcvxR_F-esHLhgytt-G1hCCsQWQIR6RqI_O4VN48jqYfMXJ0vsGiGU3WuprZD94CQ5_b
        XALycVBbGTPWLEqVKH6ZahS36tUV3hY6_ovkY01yeeJait8hxeCXaGHqihTEN1aF7iLWfi22nFMV43MMWMRjhdKvaPv
        dMNQg4VcvKGWL7i-n0KFq5GivCpJSElq5r7AWg_oi60Cad12Li1NXT2_55-7g
      TOKEN
    end
    let(:client_id) { 'tv26vabfnpn09qvqpvh2phqjd' }
    let(:user_pool_id) { 'eu-west-1_WlBhbuD6e' }

    subject { described_class.new(client_id, user_pool_id) }

    it 'decodes a given raw id token' do
      Timecop.freeze(Time.utc(2020, 6, 24, 12, 14)) do
        expect(subject.decode(token)['sub']).to eq('b7cb08da-c539-4155-bed1-ef78cb7463b0')
      end
    end
  end
end

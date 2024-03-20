require 'swagger_helper'

RSpec.describe 'api/v1/sessions', type: :request do
  path '/api/v1/login' do
    post 'Login' do
      tags 'Session'
      consumes 'application/json'
      produces 'application/json'
      request_body_example value: { user: { email: 'demo@pecuniapay.com.br', password: 'Teste@1234' } }, name: 'login_request_body_example',
summary: 'A Login Request body with default user and password'
      parameter name: :user, in: :body, schema: {
        type: :object,
        properties: {
          email: { type: :string },
          password: { type: :string },
        },
        required: ['email', 'password']
      }

      response 200, 'sign in' do
        let(:user) { create(:user) }
        after do |example|
          content = example.metadata[:response][:content] || {}
          example_spec = {
            'application/json'=>{
              examples: {
                test_example: {
                  value: JSON.parse(response.body, symbolize_names: true)
                }
              }
            }
          }
          example.metadata[:response][:content] = content.deep_merge(example_spec)
        end

        run_test!
      end

      response 401, 'unauthorized' do
        after do |example|
          example.metadata[:response][:content] = {
            'application/json' => {
              example: JSON.parse(response.body, symbolize_names: true)
            }
          }
        end

        run_test!
      end
    end
  end

  path '/api/v1/logout' do
    delete 'Logout' do
      tags 'Session'
      consumes 'application/json'
      produces 'application/json'

      response 204, 'No Content' do
        after do |example|
          example.metadata[:response][:content] = {
            'application/json' => {
              example: JSON.parse(response.body, symbolize_names: true)
            }
          }
        end

        run_test!
      end

      response 403, 'Unprocessable Entity' do
        after do |example|
          example.metadata[:response][:content] = {
            'application/json' => {
              example: JSON.parse(response.body, symbolize_names: true)
            }
          }
        end

        run_test!
      end
    end
  end
end

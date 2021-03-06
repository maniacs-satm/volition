require 'test_helper'

class TodosTest < ActionDispatch::IntegrationTest
  setup do
    @todo = todos(:get_groceries)
  end

  test 'update todo success' do
    params = {
      todo: {
        content: 'Write blog post.',
        complete: true
      }
    }

    put todo_path(@todo), params: params

    assert(response.status == 200)
    assert(@todo.reload.content == 'Write blog post.')
  end

  test 'update todo failure' do
    params = {
      bad_params: true
    }

    put todo_path(@todo), params: params

    assert(response.status == 422)
  end
end

class Mutations::AddUser < GraphQL::Function
  description "Add a new User"
  argument :userInput, Types::UserInputType

  type Types::UserType

  def call(object, args, context)
    raise ArgumentError
    user = User.new(args['userInput'].to_h)
    user.save
    user
  rescue => e
    errors = []
    errors << user.errors.full_messages if user && user.errors
    errors << e.message
    return GraphQL::ExecutionError.new("Invalid input for Post Class - #{e.class.name} Message - #{errors.join(', ')}")
  end
end

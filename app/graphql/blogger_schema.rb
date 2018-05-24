BloggerSchema = GraphQL::Schema.define do
  mutation(Types::MutationType)
  query(Types::QueryType)

  # You'll also need to define `resolve_type` for
  # telling the schema what type Relay `Node` objects are
  resolve_type ->(type, obj, ctx) {
    case obj
    when User
      Types::UserType
    when Post
      Types::PostType
    when Comment
      Types::CommentType
    else
      raise("Unexpected object: #{obj}")
    end
  }

  id_from_object ->(object, type_definition, query_context) {
    GraphQL::Schema::UniqueWithinType.encode(type_definition.name, object.id)
  }

  object_from_id ->(id, query_context) {
    type_name, item_id = GraphQL::Schema::UniqueWithinType.decode(id)
    type_name.constantize.find_by(id: item_id)
  }

  # default page size for connections
  default_max_page_size 10
end

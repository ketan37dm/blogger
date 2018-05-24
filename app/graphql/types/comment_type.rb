Types::CommentType = GraphQL::ObjectType.define do
  name "Comment"
  description "A comment on a post"

  field :content, !types.String
  field :user_id, !types.Int
  field :post_id, !types.Int
end

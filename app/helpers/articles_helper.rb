module ArticlesHelper

  # give back only comments from the database and rejects new ones
  def persisted_comments(comments)
    comments.reject{|comment| comment.new_record?}
  end
end

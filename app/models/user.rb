class User < ApplicationRecord
  def info
    {
      id: id.to_s,
      userName: name,
      age: age,
    }
  end
end

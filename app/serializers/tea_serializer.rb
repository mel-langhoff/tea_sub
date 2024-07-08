class TeaSerializer
  include JSONAPI::Serializer

  attributes  :name,
              :description,
              :brew_time,
              :temp
end

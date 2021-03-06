module Inkwell
  module Common
    def get_item_type(obj)
      post_class = Object.const_get ::Inkwell::Engine::config.post_table.to_s.singularize.capitalize
      case obj
        when ::Inkwell::Comment
          result = ::Inkwell::Constants::ItemTypes::COMMENT
        when post_class
          result = ::Inkwell::Constants::ItemTypes::POST
        else
          raise "obj should be Comment or #{post_class.class}"
      end
      result
    end

    def get_class_for_item_type(type)
      post_class = Object.const_get ::Inkwell::Engine::config.post_table.to_s.singularize.capitalize
      case type
        when ::Inkwell::Constants::ItemTypes::COMMENT
          result = ::Inkwell::Comment
        when ::Inkwell::Constants::ItemTypes::POST
          result = post_class
        else raise "obj type #{type} is unknown"
      end
      result
    end

    def check_user(obj)
      user_class = Object.const_get ::Inkwell::Engine::config.user_table.to_s.singularize.capitalize
      raise "user should be a #{user_class.to_s}" unless obj.is_a? user_class
    end

    def check_post(obj)
      post_class = Object.const_get ::Inkwell::Engine::config.post_table.to_s.singularize.capitalize
      raise "post should be a #{user_class.to_s}" unless obj.is_a? post_class
    end

    def user_id_attr
      "#{::Inkwell::Engine::config.user_table.to_s.singularize}_id"
    end

    def user_class
      Object.const_get ::Inkwell::Engine::config.user_table.to_s.singularize.capitalize
    end

    def post_class
      Object.const_get ::Inkwell::Engine::config.post_table.to_s.singularize.capitalize
    end

    def community_id_attr
      "#{::Inkwell::Engine::config.community_table.to_s.singularize}_id"
    end

    def community_class
      Object.const_get ::Inkwell::Engine::config.community_table.to_s.singularize.capitalize
    end
  end

  module Constants

    module ItemTypes
      POST = 'p'
      COMMENT = 'c'
    end

    module OwnerTypes
      USER = 'u'
      COMMUNITY = 'c'
    end

    module HashParams
      COMMUNITY_ID = 'c_id'
      USER_ID = 'u_id'
      ACCESS_LEVEL = 'a'
    end

    module CommunityAccessLevels
      WRITE = 'w'
      READ = 'r'
    end
  end
end
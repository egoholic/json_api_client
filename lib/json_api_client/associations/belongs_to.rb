module JsonApiClient
  module Associations
    module BelongsTo
      extend ActiveSupport::Concern

      module ClassMethods
        def belongs_to(attr_name, options = {})
          self.associations += [BelongsTo::Association.new(attr_name, self, options)]
        end
      end

      class Association < BaseAssociation
        def param
          @param ||= :"#{attr_name}_id"
        end

        def to_prefix_path
          "#{attr_name.to_s.pluralize}/%{#{param}}"
        end
      end
    end
  end
end
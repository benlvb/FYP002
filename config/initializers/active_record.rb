module ActiveRecord
  module ConnectionAdapters
    module PostgreSQL
      module OID # :nodoc:
        class Uuid < Type::Value # :nodoc:
          def type_cast_from_user(value)
            #UUIDTools::UUID.serialize(value) if value
            value
          end
          alias_method :type_cast_from_database, :type_cast_from_user
        end
      end
    end
  end
end
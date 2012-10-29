# encoding: utf-8
require 'spec_helper'

describe Discoverer::Reader do
  describe "#from" do
    context "para la clase Klass" do
      it "debería tratar de instanciar la clase Reader::Klass" do
        module Reader
          class Klass
          end
        end

        Reader::Klass.should_receive :new

        class Klass
          include Discoverer::Reader
        end

        obj = Klass.new
        obj.from
      end

      it "debería pasarle como argumento el objeto actual" do
        module Reader
          class Klass
          end
        end

        class ::Klass
          include Discoverer::Reader
        end

        obj = ::Klass.new

        Reader::Klass.should_receive( :new ).with obj

        obj.from
      end

      it "debería devolver el mismo reader si es llamado dos veces" do
        module Reader
          class Klass
          end
        end

        class ::Klass
          include Discoverer::Reader
        end

        obj = ::Klass.new

        reader = stub 'reader'
        Reader::Klass.should_receive( :new ).with( obj ).and_return reader

        obj.from.should === reader
        obj.from.should === reader
      end
    end

    context "para una subclase" do
      it "debería andar de una, provisto que existe el pattern correcto" do
        module Reader
          class UserR
          end
        end

        class Model
          include Discoverer::Reader
        end

        class UserR < Model
        end
        obj = UserR.new
        Reader::UserR.should_receive( :new ).with obj
        obj.from
      end
    end

    context "en realidad no hay reader" do
      it 'debería fallar con un error que explique más o menos' do
        class Ponele
          include Discoverer::Reader
        end

        obj = Ponele.new
        expect { obj.from
        }.to raise_error Discoverer::Reader::MissingReaderError,
          "The reader for Ponele (Reader::Ponele) wasn't found, please create it"
      end
    end
  end
end
module Sdl3
  module TTF
    class TextEngine < SdlObject(LibSdl3TTF::TextEngine*)
      enum Kind
        Surface
        Renderer
        GPU
      end

      getter kind : Kind

      def initialize(renderer : Renderer, @owned = true)
        @kind = Kind::Renderer
        @pointer = LibSdl3TTF.create_renderer_text_engine(renderer)
        Sdl3.raise_error if @pointer.null?
      end

      def initialize(@owned = true)
        @kind = Kind::Surface
        @pointer = LibSdl3TTF.create_surface_text_engine
        Sdl3.raise_error if @pointer.null?
      end

      def initialize(device : GPUDevice, @owned = true)
        @kind = Kind::GPU
        @pointer = LibSdl3TTF.create_gpu_text_engine(device)
        Sdl3.raise_error if @pointer.null?
      end

      def initialize(@pointer, @kind, @owned = true)
        super(@pointer, @owned)
      end

      def sdl_finalize
        case kind
        when Kind::Surface
          LibSdl3TTF.destroy_surface_text_engine(self)
        when Kind::Renderer
          LibSdl3TTF.destroy_renderer_text_engine(self)
        when Kind::GPU
          LibSdl3TTF.destroy_gpu_text_engine(self)
        end
      end
    end
  end
end

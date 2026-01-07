require "./lib_image"

module Sdl3
  module Image
    def self.version
      LibSdl3Image.img_version
    end

    def self.load(path : String)
      ptr = LibSdl3Image.load(path)
      Sdl3.raise_error if ptr.null?
      Surface.new(ptr)
    end

    def self.load_texture(path : String)
      ptr = LibSdl3Image.load_texture(path)
      Sdl3.raise_error if ptr.null?
      Texture.new(ptr)
    end

    def self.clipboard_image
      ptr = LibSdl3Image.get_clipboard_image
      Sdl3.raise_error if ptr.null?
      Surface.new(ptr)
    end

    def self.save(surface : Surface, path : String)
      Sdl3.raise_error unless LibSdl3Image.save(surface, path)
    end

    def self.save_png(surface : Surface, path : String)
      Sdl3.raise_error unless LibSdl3Image.save_png(surface, path)
    end

    def self.save_bmp(surface : Surface, path : String)
      Sdl3.raise_error unless LibSdl3Image.save_bmp(surface, path)
    end

    def self.save_cur(surface : Surface, path : String)
      Sdl3.raise_error unless LibSdl3Image.save_cur(surface, path)
    end

    def self.save_gif(surface : Surface, path : String)
      Sdl3.raise_error unless LibSdl3Image.save_gif(surface, path)
    end

    def self.save_ico(surface : Surface, path : String)
      Sdl3.raise_error unless LibSdl3Image.save_ico(surface, path)
    end

    def self.save_tga(surface : Surface, path : String)
      Sdl3.raise_error unless LibSdl3Image.save_tga(surface, path)
    end

    def self.save_avif(surface : Surface, path : String, quality : Int32)
      Sdl3.raise_error unless LibSdl3Image.save_avif(surface, path, quality)
    end

    def self.save_jpg(surface : Surface, path : String, quality : Int32)
      Sdl3.raise_error unless LibSdl3Image.save_jpg(surface, path, quality)
    end

    def self.save_webp(surface : Surface, path : String, quality : Float32)
      Sdl3.raise_error unless LibSdl3Image.save_webp(surface, path, quality)
    end
  end
end

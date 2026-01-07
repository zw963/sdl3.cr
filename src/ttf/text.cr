module Sdl3
  module TTF
    class Text < SdlObject(LibSdl3TTF::Text*)
      alias Direction = LibSdl3TTF::Direction

      def self.create(engine : TextEngine, font : Font, text : String)
        ptr = LibSdl3TTF.create_text(engine, font, text, text.bytesize)
        Sdl3.raise_error if ptr.null?
        new(ptr)
      end

      # TTF_DestroyText
      def sdl_finalize
        LibSdl3TTF.destroy_text(self)
      end

      def num_lines
        @pointer.value.num_lines
      end

      def draw(x, y, surface : Surface)
        LibSdl3TTF.draw_surface_text(self, x, y, surface)
      end

      def text_engine=(engine : TextEngine)
        LibSdl3TTF.create_surface_text_engine
      end

      def properties
        id = LibSdl3TTF.get_text_properties(self)
        Properties.new(id)
      end

      # TTF_SetTextFont
      def font=(font : Font)
        Sdl3.raise_error unless LibSdl3TTF.set_text_font(self, font)
      end

      # TTF_GetTextFont
      def font
        ptr = LibSdl3TTF.get_text_font(self)
        Sdl3.raise_error if ptr.null?
        Font.new(ptr)
      end

      # TTF_Direction direction
      def direction=(direction : Direction)
        LibSdl3TTF.set_text_direction(self, direction : Direction)
      end

      # TTF_GetTextDirection
      def direction
        LibSdl3TTF.get_text_direction(self)
      end

      # TTF_SetTextScript
      def script=(script)
        LibSdl3TTF.raise_error unless LibSdl3TTF.set_text_script(self, script)
      end

      # TTF_GetTextScript
      def script
        LibSdl3TTF.get_text_script(self)
      end

      def color=(value : Tuple(UInt8, UInt8, UInt8, UInt8))
        set_color(*value)
      end

      def color=(value : Tuple(Float32, Float32, Float32, Float32))
        set_color(*value)
      end

      # TTF_SetTextColor
      def set_color(r : UInt8, g : UInt8, b : UInt8, a : UInt8 = 255)
        LibSdl3TTF.set_text_color(self, r, g, b, a)
      end

      # TTF_SetTextColorFloat
      def set_color(r : Float32, g : Float32, b : Float32, a : Float32 = 1.0f32)
        LibSdl3TTF.set_text_color_float(self, r, g, b, a)
      end

      # TTF_GetTextColor
      def color
        LibSdl3TTF.get_text_color(self, out r, out g, out b, out a)
        {r, g, b, a}
      end

      # TTF_GetTextColorFloat
      def color_f32
        LibSdl3TTF.get_text_color_float(self, out r, out g, out b, out a)
        {r, g, b, a}
      end

      # TTF_SetTextPosition
      def position=(position : Tuple(Int32, Int32))
        LibSdl3TTF.set_text_position(self, *position)
      end

      # TTF_GetTextPosition
      def position
        LibSdl3TTF.get_text_position(self, out x, out y)
        {x, y}
      end

      # TTF_SetTextWrapWidth
      def wrap_width=(wrap_width : Int32)
        LibSdl3TTF.set_text_wrap_width(self, wrap_width)
      end

      # TTF_GetTextWrapWidth
      def wrap_width
        LibSdl3TTF.get_text_wrap_width(self, out wrap_width)
        wrap_width
      end

      # TTF_SetTextWrapWhitespaceVisible
      def wrap_whitespace_visible=(visible : Bool)
        LibSdl3TTF.set_text_wrap_whitespace_visible(self, visible)
      end

      # TTF_TextWrapWhitespaceVisible
      def text_wrap_whitespace_visible
        LibSdl3TTF.text_wrap_whitespace_visible(self)
      end

      # TTF_SetTextString
      def string=(string : String)
        LibSdl3TTF.set_text_string(self, string, string.bytesize)
      end

      def string
        String.new(@pointer.value.text)
      end

      def update_string
        self.string = yield(self.string)
      end

      # TTF_InsertTextString
      def insert_at(offset, string : String)
        LibSdl3TTF.insert_text_string(self, offset, string, string.bytesize)
      end

      # TTF_AppendTextString
      def append(string : String)
        LibSdl3TTF.append_text_string(self, string, string.bytesize)
      end

      # TTF_DeleteTextString
      def delete_at(offset, length)
        LibSdl3TTF.delete_text_string(self, offset, length)
      end

      # TTF_GetTextSize(TTF_Text *text, int *w, int *h);
      def size
        LibSdl3TTF.get_text_size(self, out w, out h)
        {w, h}
      end
    end
  end
end

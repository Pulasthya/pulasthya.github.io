module Jekyll
  class FileExistsTag < Liquid::Tag

    def initialize(tag_name, file, tokens)
      super
      @file = file.strip
    end

    def render(context)
      site_source = context.registers[:site].source
      file_path = File.join(site_source, @file)
      File.exist?(file_path).to_s
    end
  end
end

Liquid::Template.register_tag('file_exists', Jekyll::FileExistsTag)

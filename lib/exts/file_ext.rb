# frozen_string_literal: true

class File
  def self.write_tempfile(file_name, file_content)
    f = Tempfile.open [File.basename(file_name, ".*"), File.extname(file_name)]
    f.binmode
    f.write file_content
    f.close
    f
  end

  def self.to_temp_file(file)
    if file.respond_to?('get_input_stream')
      write_tempfile File.filename(file), file.get_input_stream.read
    else
      write_tempfile File.filename(file), File.read(file)
    end
  end

  def self.filename(file)
    return file.name if file.respond_to?('name')

    File.basename(file.path)
  end
end

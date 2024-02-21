# frozen_string_literal: true

require "yaml"

module PgnYamlConverter
  # 変換を司る。
  class Converter
    attr_reader :content, :output

    def initialize
      @strings = []
      @content = { "strings" => @strings }
      @output = []
    end

    # pgn から yaml へ変換。
    def pgn2yaml(filename)
      strings_mode = false
      File.open(filename, "r") do |f|
        f.each_line do |line|
          if strings_mode
            add_strings(line.chomp)
          else
            str = line.chomp.match(/^\[(\w+) "(.+)"\]$/)
            if str.nil?
              strings_mode = true
              add_strings(line.chomp)
            else
              @content[str[1]] = str[2]
            end
          end
        end
      end
      content2yaml
      puts @output
    end

    # str を srtings に追加する
    def add_strings(str)
      @strings << str
    end

    # content を yaml に変換する
    def content2yaml
      @content.each do |k, v|
        @output << "#{k}: #{v}" unless k == "strings"
      end
      @output << "strings: |-"
      @strings.each do |s|
        @output << "  #{s}"
      end
    end

    # yaml から png へ変換。
    def yaml2pgn(filename)
      y = YAML.load_file(filename)
      y.each do |k, v|
        @output << "[#{k} \"#{v}\"]" unless k == "strings"
      end
      @strings = y["strings"].split("\n")
      @strings.each do |s|
        @output << s
      end
      puts @output
    end
  end
end

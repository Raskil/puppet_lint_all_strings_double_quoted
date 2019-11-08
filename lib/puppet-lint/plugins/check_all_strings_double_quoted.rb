PuppetLint.new_check(:all_strings_double_quoted) do
  ESCAPE_CHAR_RE = %r{\$[a-zA-Z0-9]|\$\{.*\}|\\|"}

  def check
    tokens.select { |token|
      token.type == :SSTRING &&
          token.value.gsub(' ' * token.column, "\n")[ESCAPE_CHAR_RE].nil?
    }.each do |token|
      notify(
          :warning,
          :message => 'string not double quoted.',
          :line    => token.line,
          :column  => token.column,
          :token   => token
      )
    end
  end

  def fix(problem)
    problem[:token].type = :STRING
  end
end
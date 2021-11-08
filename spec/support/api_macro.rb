module ApiMacro
  @parsed_body || = JSON.parse(response.body, symbolize_names: true)
end
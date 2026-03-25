--- @since 26.1.22

local function info(content)
	return ya.notify {
		title = "Date",
		content = content,
		timeout = 2,
	}
end

local function extension(default_value)
  return ya.input {
    pos = { "center", w = 30 },
    title = "File Extension:",
    value = default_value,
    obscure = false,
    realtime = false,
  }
end

return {
	entry = function(_, job)
    date = os.date("%Y-%m-%d")

    if job.args.ext == "" then
      ext = ""
    else
      ext = job.args.ext
    end

		local ext, event = extension(ext)
		if not event == 1 then
			return
		end

    if string.sub(ext, 1, 1) ~= "." and ext ~= "" then
      ext = "." .. ext
    end

    filename = date .. ext

    file = io.open(filename, "w")
    file:close()
	end,
}

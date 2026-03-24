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
		local date, err = Command("date"):arg("-I"):output()
		if not date then
			return info("Failed to run 'date', error: " .. err)
		elseif date.stdout == "" then
			return info("Failed to run 'date', error: no date was returned")
		end

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

    filename = date.stdout:gsub("^%s*(.-)%s*$", "%1") .. ext

		local output, err = Command("touch"):arg(filename):output()
		if not output then
			return info("Failed to run 'touch', error: " .. err)
		end
	end,
}

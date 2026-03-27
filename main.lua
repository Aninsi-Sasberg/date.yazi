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
    local filename = os.date("%Y-%m-%d")
    local ext = ""
    local event = 0

    local dir = false
    if job.args.dir == true then
      dir = true
    elseif not job.args.ext == "" then
      ext = job.args.ext
    end

    if not dir then
      ext, event = extension(ext)
      if not event == 1 then
        info("Couldn't read Extension.")
        return
      end

      if string.sub(ext, 1, 1) ~= "." and ext ~= "" then
        ext = "." .. ext
      end

      filename = filename .. ext
      file = io.open(filename, "w")
      file:close()
    else
      local ok, err = fs.create("dir", Url(filename))
      if err then
        info(err)
        return
      end
    end
  end
}

return {
  name = "apt install local",
  request = {
    action = "install",
    system = "apt",
    localPath = "/tmp/example-pkg.tgz",
  },
  fakeExec = {
    {
      match = "apt install /tmp/example-pkg.tgz",
      exitCode = 0,
      stdout = "installed\n",
      stderr = "",
      success = true,
    },
  },
  expect = {
    success = true,
    events = { "installed", "success" },
    eventPayloads = {
      installed = "{localTarget=true, path=/tmp/example-pkg.tgz}",
      success = "ok",
    },
  }
}

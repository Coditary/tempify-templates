return {
  name = "{{ system_name }} list",
  request = {
    action = "list",
    system = "{{ system_name }}",
  },
  fakeExec = {
    {
      match = "{{ system_name }} list",
      exitCode = 0,
      stdout = "example-pkg 1.0.0\n",
      stderr = "",
      success = true,
    },
  },
  expect = {
    success = true,
    events = { "listed" },
    resultCount = 1,
    resultName = "example-pkg",
  }
}

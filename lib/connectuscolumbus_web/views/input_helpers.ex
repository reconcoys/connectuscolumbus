defmodule ConnectuscolumbusWeb.InputHelpers do
  use Phoenix.HTML

  def input(form, field) do
    type = Phoenix.HTML.Form.input_type(form, field)

    wrapper_opts = [class: "form-group"]
    label_opts = [class: "control-label"]
    input_opts = [class: "form-control"]

    content_tag :div, wrapper_opts do
      label = label(form, field, humanize(field), label_opts)
      input = apply(Phoenix.HTML.Form, type, [form, field, input_opts])
      error = ConnectuscolumbusWeb.ErrorHelpers.error_tag(form, field) || ""
      [label, input, error]
    end
  end
end

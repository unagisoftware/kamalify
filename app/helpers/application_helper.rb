module ApplicationHelper
  def copy_to_clipboard_btn(text)
    tag.button class: 'flex gap-1 items-center text-gray-400 cursor-pointer hover:text-gray-200 relative',
      data: {
        controller: 'copy-to-clipboard', action: 'copy-to-clipboard#copy',
        copy_to_clipboard_content_value: text
      } do
      concat icon("clipboard", class: "h-4 w-4")
      concat content_tag :span, "Copy"
      concat content_tag :span, "Copied!",
        class: "absolute -top-6 text-xs text-gray-100 opacity-0",
        data: { copy_to_clipboard_target: "message" }
    end
  end

  def download_button
    tag.button "", class: "flex gap-1 items-center text-gray-400 cursor-pointer hover:text-gray-200",
      data: {
        action: "autosubmit#submit",
        autosubmit_format_param: "yaml"
      } do
      concat icon "arrow-down-tray", class: "w-4 h-4"
      concat content_tag :span, "Download"
    end
  end
end

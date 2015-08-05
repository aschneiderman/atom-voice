# My init script

# NOTES:
#  * Before command has been tied to a keymap, Use control-shift-p to get to it

# tell_user: my equivalent of a simple dialog box
tell_user = (user_message) ->
  atom.confirm
    message: user_message
    buttons:
      OK:  =>

atom.commands.add 'atom-text-editor', 'custom:say-hi', ->
  tell_user "Hi there!"

# Up next: add snippets to make commands easier to create (and document in this and key map file)
#          Figure out how to create a cut to bookmark command


# ---------------------------------------------------------------------------------------
# commands and other stuff I might want to try out

# Example script: creating a markdown link using what you have selected and what you last copied
atom.commands.add 'atom-text-editor', 'markdown:paste-as-link-anders', ->
  return unless editor = atom.workspace.getActiveTextEditor()
  selection = editor.getLastSelection()
  clipboardText = atom.clipboard.read()
  selection.insertText("[#{selection.getText()}](#{clipboardText})")

# Example: log to the console when each text editor is saved.
# atom.workspace.observeTextEditors (editor) ->
#   editor.onDidSave ->
#     console.log "Saved! #{editor.getPath()}"

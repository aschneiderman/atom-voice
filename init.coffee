# My init script

# -----------------------------------------------------------------------------
# Helper functions
# here's a test comment to see if it's properly synchronizing with GitHub

# tellUser: my equivalent of a simple dialog box
tellUser = (user_message) ->
  atom.confirm
    message: user_message
    buttons:
      OK:  =>

updateCurrentLine = (updateFunction)  ->
  # updateCurrentLine: runs updateFunction on the current line and replaces the current line with the result
  return unless editor = atom.workspace.getActiveTextEditor()
  myCursor = editor.getCursorBufferPosition()
  editor.selectLinesContainingCursors()    # NOTE: Will do weird things if you have multiple cursors active
  line =  editor.getLastSelection().getText()
  editor.insertText("#{updateFunction(line)}")
  editor.setCursorBufferPosition(myCursor)


# -----------------------------------------------------------------------------
# My commands

atom.commands.add 'atom-text-editor', 'voice:delete-tag', ->
# delete-tag: Deletes the current line's outer tags  (e.g., to get rid of paragraph tags)
  updateCurrentLine ( (line) ->
    line.replace(/<([^>]+)>(.*)<\/\1>\s*\n$/, "$2\n" )
  )









# ---------------------------------------------------------------------------------------
# commands and other stuff I might want to try out

# Example script: creating a markdown link using what you have selected and what you last copied
atom.commands.add 'atom-text-editor', 'markdown:paste-as-link-anders', ->
  return unless editor = atom.workspace.getActiveTextEditor()
  selection = editor.getLastSelection()
  clipboard = atom.clipboard.read()
  selection.insertText("[#{selection.getText()}](#{clipboard})")

# Example: log to the console when each text editor is saved.
# atom.workspace.observeTextEditors (editor) ->
#   editor.onDidSave ->
#     console.log "Saved! #{editor.getPath()}"

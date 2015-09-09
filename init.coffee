# My init script

# -----------------------------------------------------------------------------
# Helper functions

# tellUser: my equivalent of a simple dialog box
tellUser = (user_message) ->
  atom.confirm
    message: user_message
    buttons:
      OK:  =>

fixCurrentLine = (fixingFunction)  ->
  # fixCurrentLine: runs fixingFunction on the current line and replaces the current line with the result
  return unless editor = atom.workspace.getActiveTextEditor()
  myCursor = editor.getCursorBufferPosition()
  editor.selectLinesContainingCursors()    # NOTE: Will do weird things if you have multiple cursors active
  line =  editor.getLastSelection().getText()
  editor.insertText("#{fixingFunction(line)}")
  editor.setCursorBufferPosition(myCursor)


# -----------------------------------------------------------------------------
# My commands

atom.commands.add 'atom-text-editor', 'voice:delete-tag', ->
# delete-tag: Deletes the outer tags -- e.g., <p>...</p> -- the current line
  fixCurrentLine ( (line) ->
    line.replace(/<([^>]+)>(.*)<\/\1>\s*\n$/, "$2\n" )
  )


atom.commands.add 'atom-text-editor', 'd3s:html-format-code', ->
# html-format-code: Convert the D3 code stored in the clipboard into preformatted HTML and insert it
  return unless editor = atom.workspace.getActiveTextEditor()
  text = atom.clipboard.read()
  text = text.replace(/&/gm, "&amp")
  text = text.replace(/</gm, "&lt")
  text = text.replace(/>/gm, "&gt")
  editor.insertText("\n<pre>#{text}\n </pre>")


atom.commands.add 'atom-text-editor', 'd3s:add-italics-and-id', ->
# add-italics-and-id: Replace the selection with the <i id=, using the clipboard and the selected item
  return unless editor = atom.workspace.getActiveTextEditor()
  selectionText = editor.getLastSelection()
  clipboardText = atom.clipboard.read()
  editor.insertText("\<i id=\"#{clipboardText}\"\>#{selectionText.getText()}\<\/i\>")


atom.commands.add 'atom-text-editor', 'd3s:create-input-form', ->
# create-input-form: Using the preformatted section, which needs to have been copied into the clipboard,
#   create the input form, with one line per highlighted variable
  return unless editor = atom.workspace.getActiveTextEditor()
  code = atom.clipboard.read()
  italicIDs = code.match(/id/gm)
  italicIDs = "Watch out for the rock!".match(/r?or?/g)
  # italicIDs = '  width = <i id="width">40</i>, height = <i id="height">40</i>, cellsize = <i id="cellsize">39</i>;'.match(/ id/g)
  editor.insertText("#{italicIDs}")









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

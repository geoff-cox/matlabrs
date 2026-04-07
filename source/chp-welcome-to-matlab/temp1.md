<task label="rq-matlab-desktop-1">
			<statement>
				<p>
					What prompt symbol appears in the Command Window, indicating MATLAB is ready for input?
				</p>
			</statement>
			<choices randomize="yes">
				<choice correct="yes">
					<statement><p><pf>&gt;&gt;</pf></p></statement>
					<feedback><p>Correct. The double greater-than symbol <pf>&gt;&gt;</pf> is the MATLAB command prompt.</p></feedback>
				</choice>
				<choice>
					<statement><p><pf>$</pf></p></statement>
					<feedback><p>The dollar sign is used in Unix/Linux shells, not in MATLAB.</p></feedback>
				</choice>
				<choice>
					<statement><p><pf>&gt;</pf></p></statement>
					<feedback><p>A single greater-than is not MATLAB's prompt. MATLAB uses a double greater-than <pf>&gt;&gt;</pf>.</p></feedback>
				</choice>
				<choice>
					<statement><p><pf>%</pf></p></statement>
					<feedback><p>The percent sign is used to start a comment in MATLAB code, not as the prompt.</p></feedback>
				</choice>
			</choices>
		</task>

		<task label="rq-matlab-desktop-2">
			<statement correct="yes">
				<p>
					Variables created in the Command Window appear automatically in the Workspace panel.
				</p>
			</statement>
			<feedback>
				<p>
					Correct. Any variable you define, whether in the Command Window or by running a script, is tracked in the Workspace.
				</p>
			</feedback>
		</task>

		<task label="rq-matlab-desktop-3">
			<statement>
				<p>
					Which panel shows the files and folders in your current working directory?
				</p>
			</statement>
			<choices randomize="yes">
				<choice correct="yes">
					<statement><p>Files</p></statement>
					<feedback><p>Correct. The Files panel (also called the Current Folder panel) shows the contents of the active working directory.</p></feedback>
				</choice>
				<choice>
					<statement><p>Workspace</p></statement>
					<feedback><p>The Workspace shows variables in memory, not files on disk.</p></feedback>
				</choice>
				<choice>
					<statement><p>Command Window</p></statement>
					<feedback><p>The Command Window displays command output. To see files, use the Files panel.</p></feedback>
				</choice>
				<choice>
					<statement><p>Editor</p></statement>
					<feedback><p>The Editor opens and edits specific files. The Files panel lets you browse for them.</p></feedback>
				</choice>
			</choices>
		</task>

		<task label="rq-matlab-desktop-4">
			<statement correct="no">
				<p>
					The MATLAB Desktop layout cannot be changed; all panels are fixed in place.
				</p>
			</statement>
			<feedback>
				<p>
					Incorrect. The MATLAB Desktop is fully customizable. Panels can be shown, hidden, moved, and docked to suit your workflow.
				</p>
			</feedback>
		</task>

		<task label="rq-matlab-desktop-5">
			<statement>
				<p>
					A student types <pf>x = 5</pf> in the Command Window and presses <kbd>Enter</kbd>. In which panel will the variable <pf>x</pf> immediately appear?
				</p>
			</statement>
			<choices randomize="yes">
				<choice correct="yes">
					<statement><p>Workspace</p></statement>
					<feedback><p>Correct. After executing any assignment, the variable appears in the Workspace where you can see its name, size, and value.</p></feedback>
				</choice>
				<choice>
					<statement><p>Editor</p></statement>
					<feedback><p>The Editor shows program code, not live variable values. Variable tracking happens in the Workspace.</p></feedback>
				</choice>
				<choice>
					<statement><p>Files</p></statement>
					<feedback><p>The Files panel shows files on disk. In-memory variables appear in the Workspace.</p></feedback>
				</choice>
				<choice>
					<statement><p>Command History</p></statement>
					<feedback><p>The Command History records past commands, not variable values. Variables appear in the Workspace.</p></feedback>
				</choice>
			</choices>
		</task>

		<task label="rq-matlab-desktop-6">
			<statement>
				<p>
					What is the primary purpose of the Editor panel?
				</p>
			</statement>
			<choices randomize="yes">
				<choice correct="yes">
					<statement><p>To write, edit, and save MATLAB scripts and functions.</p></statement>
					<feedback><p>Correct. The Editor is designed for authoring program files, not for one-off interactive commands.</p></feedback>
				</choice>
				<choice>
					<statement><p>To display variables and their values.</p></statement>
					<feedback><p>That is the role of the Workspace panel, not the Editor.</p></feedback>
				</choice>
				<choice>
					<statement><p>To browse files in the current directory.</p></statement>
					<feedback><p>That is the role of the Files panel. The Editor is for writing code.</p></feedback>
				</choice>
				<choice>
					<statement><p>To enter quick one-line calculations.</p></statement>
					<feedback><p>Quick calculations are done in the Command Window. The Editor is for longer programs saved as files.</p></feedback>
				</choice>
			</choices>
		</task>

		<task label="rq-matlab-desktop-7">
			<statement correct="no">
				<p>
					The Workspace panel is only visible when you are running a script.
				</p>
			</statement>
			<feedback>
				<p>
					Incorrect. The Workspace is visible at all times by default. It updates whenever you create or modify variables, whether from the Command Window or from a running script.
				</p>
			</feedback>
		</task>

		<task label="rq-matlab-desktop-8">
			<statement>
				<p>
					How do you press to execute a command you have typed in the Command Window?
				</p>
			</statement>
			<choices randomize="yes">
				<choice correct="yes">
					<statement><p><kbd>Enter</kbd></p></statement>
					<feedback><p>Correct. Pressing <kbd>Enter</kbd> after typing a command causes MATLAB to evaluate it immediately.</p></feedback>
				</choice>
				<choice>
					<statement><p><kbd>F5</kbd></p></statement>
					<feedback><p><kbd>F5</kbd> runs the current script in the Editor. In the Command Window, you press <kbd>Enter</kbd>.</p></feedback>
				</choice>
				<choice>
					<statement><p><kbd>Ctrl+Enter</kbd></p></statement>
					<feedback><p><kbd>Ctrl+Enter</kbd> runs the current section of a script in the Editor. In the Command Window, press <kbd>Enter</kbd>.</p></feedback>
				</choice>
				<choice>
					<statement><p><kbd>Tab</kbd></p></statement>
					<feedback><p><kbd>Tab</kbd> triggers auto-completion in MATLAB. To run a command, press <kbd>Enter</kbd>.</p></feedback>
				</choice>
			</choices>
		</task>

		<task label="rq-matlab-desktop-9">
			<statement correct="yes">
				<p>
					The Files panel and the Workspace panel serve different purposes: Files shows what is on disk, while Workspace shows what is in memory.
				</p>
			</statement>
			<feedback>
				<p>
					Correct. The Files panel browses saved files on your computer, while the Workspace tracks variables currently loaded into MATLAB's memory.
				</p>
			</feedback>
		</task>

		<task label="rq-matlab-desktop-10">
			<statement>
				<p>
					A student wants to hide the Workspace panel to get more screen space. How can they do this?
				</p>
			</statement>
			<choices randomize="yes">
				<choice correct="yes">
					<statement><p>Drag or close the panel using the desktop customization tools.</p></statement>
					<feedback><p>Correct. The MATLAB Desktop allows panels to be hidden, moved, or docked using the sidebar controls and drag-and-drop.</p></feedback>
				</choice>
				<choice>
					<statement><p>Type <pf>hide workspace</pf> in the Command Window.</p></statement>
					<feedback><p>There is no such command. Panel visibility is controlled through the desktop interface.</p></feedback>
				</choice>
				<choice>
					<statement><p>Restart MATLAB without the Workspace loaded.</p></statement>
					<feedback><p>Restarting does not change the panel layout. Use the desktop customization tools instead.</p></feedback>
				</choice>
				<choice>
					<statement><p>The Workspace cannot be hidden.</p></statement>
					<feedback><p>Any panel in MATLAB can be hidden or rearranged using the desktop layout tools.</p></feedback>
				</choice>
			</choices>
		</task>
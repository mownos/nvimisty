return {
	typos = {
		config = {
			-- Logging level of the language server. Logs appear in :LspLog. Defaults to error.
			cmd_env = { RUST_LOG = "info" },
		},
		init_options = {
			-- Custom config. Used together with any workspace config files, taking precedence for
			-- settings declared in both. Equivalent to the typos `--config` cli argument.
			config = "~/code/typos-lsp/crates/typos-lsp/tests/typos.toml",
			-- How typos are rendered in the editor, eg: as errors, warnings, information, or hints.
			-- Defaults to error.
			diagnosticSeverity = "Information",
		},
	},
}

-- USAGE
-- Command/Mapping      Description
-- :AmazonQ             Open Amazon Q chat window
-- zq                   Select text, then type zq to append it to the chat context. Equivalent to: select text, type :AmazonQ, then run the command.
-- :AmazonQ refactor    Select code, then run this to get refactoring suggestions
-- :.AmazonQ fix        Fix only the current line (the standard "." range means "current line")
-- :%AmazonQ optimize   Optimize the entire contents of the current file
-- :AmazonQ explain     Explain the current file
return {
	{
		name = "amazonq",
		url = "https://github.com/awslabs/amazonq.nvim.git",
		opts = {
			ssoStartUrl = "https://d-9a671cd8e3.awsapps.com/start", -- Authenticate with Amazon Q Free Tier
		},
	},
}

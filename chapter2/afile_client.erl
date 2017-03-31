-module(afile_client).
-export([ls/1, get_file/2]).

ls(Server) ->
	Server ! {self(), list_dir},
	receive
		{Server, FileList} ->
			FileList
	end.

get_file(Server, File) ->
	Server ! {self(), {get_file, File}},
	receive
		{Server, Content} ->
			Content
	end.

%Chapter 2, exercise 4 pending
%write_file(Server, Route, Filename) ->
%	Bytes = file:read_file(Route),
%	Server ! {self(), {put_file, Bytes, Filename}},
%	receive
%		{Server, Content} ->
%			Content
%	end.

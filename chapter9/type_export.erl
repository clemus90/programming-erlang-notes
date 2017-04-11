-module(type_export).

-type rich_text() :: [font(), char()].
-type font() :: integer().
% exports the type similar to the export of functionality
-export_type([fich_text/0, font/0]).
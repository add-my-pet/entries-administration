%% select_taxon
% selects a taxon from list

%%
function [taxon, s, v] = select_taxon (list, leaves)
%% created 2016/02/25 by Bas Kooijman, modified 2018/06/14

%% Syntax
% [taxon, s, v] = <../select_taxon.m *select_taxon*> (list, leaves)

%% Description
% select a taxon from a list of all possibilities
%
% Input:
% 
% * list: optional input with cell-vector of possible taxa (default: 'Animalia')
% * leaves: optional boolean to include leaves (default: true)
%
% Output: 
% 
% * taxon: string with name of taxon
% * s: index of taxon in the list
% * v: 0 when no selection is made, or 1 when a selection is made

%% Remarks
% taxon and s are empty, and v = 0, if cancel has been selected.
% taxon is 'Animalia', and v = 1, if no selection has been made and OK is selected

%% Example of use
% select_taxon or select_taxon(list_taxa('Insecta'))

if ~exist('list', 'var')
  list = list_taxa; 
elseif exist('leaves', 'var')
  list = list_taxa(list, leaves);
end

n = length(list); i = 1:n;
i = i(strcmp(list, 'Animalia'));
[s, v] = listdlg('PromptString', 'Select a taxon', 'ListString', list, 'Selectionmode', 'single', 'InitialValue', i);
taxon = list{s};

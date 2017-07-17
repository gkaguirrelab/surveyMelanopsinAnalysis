
% qualtricsAnalysis_main
%
% This routine loads the .csv files generated by Qualtrics that have the
% results of the migraine diagnostic pathway.
%
%  https://upenn.co1.qualtrics.com/jfe/form/SV_4NQzKbssiT8qqVf
%

%% Housekeeping
clear variables
close all

[~, userName] = system('whoami');
userName = strtrim(userName);
dropboxDir = ...
    fullfile('/Users', userName, '/Dropbox (Aguirre-Brainard Lab)');

%% Set paths to data and output
qualtricsDataDir = '/MELA_subject/QualtricsData/';
analysisDir = '/MELA_analysis/surveyMelanopsinAnalysis/Qualtrics/';

% Set the output filenames
outputResultExcelName=fullfile(dropboxDir, analysisDir, 'MELA_QualtricsHeadacheResults.xlsx');
rawDataSheets={'Headache Assessment Instrument v1.1_July 5, 2017_09.32.csv'};

% Loop through the datasheets

% get the full path to thisDataSheet
thisDataSheetFileName=fullfile(dropboxDir, qualtricsDataDir, rawDataSheets{1});

% load and pre-process thisDataSheet, returning table "T"
[T, notesText] = qualtricsAnalysis_preProcess(thisDataSheetFileName);

% classify headache
qualtricsAnalysis_classifyHeadache( T )


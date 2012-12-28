%{
Author:-  Omair Sarwar
          Lulea University of Technology

Purpose:- Implementation of TM SPACE DATA LINK PROTOCOL by
          Consultative Committee for Space Data Systems (CCSDS 132.0-B-1)

Date:- 26-12-2012

%}

%=======================================
% Primary Header Generation
%=======================================

TFVN = 0;                                                       %transfer frame version number
SCID = 777;                                                     %Spacecraft ID 

TFVN = de2bi(TFVN , 2);
SCID = de2bi(SCID , 10);
MCID = [TFVN SCID];                                             %MASTER CHANNEL ID

 VCID = 7;                                                      %Virtual Channel Identifier
 OCF  = 0;                                                      %Operational control field
 MCFC = 0;                                                      %MASTER channel frame count
 VCFC = 0;                                                      %Virtual channel frame count

 VCID = de2bi(VCID , 3);
 MCFC = de2bi(MCFC , 8);
 VCFC = de2bi(VCFC , 8);
% 

 TF_SHF = 0;                                                    %Transfer Frame Secondary Header Flag 
 sync_flag =0;                                                  %Synchronization Flag
 packet_order_flag =0 ;                                         %Packet Order Flag
 Seg_length_ID = 3;                                             %Segment Length Identifier   
 FH_pointer = 1;                                                %First Header Pointer
 
 Seg_length_ID = de2bi(Seg_length_ID , 2); 
 FH_pointer = de2bi(FH_pointer , 11);

 %TRANSFER FRAME DATA FIELD STATUS
 TF_DFS = [TF_SHF   sync_flag   packet_order_flag   Seg_length_ID   FH_pointer ];   

% primary header creation 
 primary_header = [MCID     VCID    OCF     MCFC    VCFC    TF_DFS];
 
%data packet
data = ['A' 'B' 'C' 'D' 'E' 'F'];
data = double(data);
data = de2bi(data,8);
data=data';
data=data(:);
data_array = data';

% TM Transfer frame
TM_transfer_frame = [primary_header     data_array];
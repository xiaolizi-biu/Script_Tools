function result = select_data_time(data,time_start,time_stop)
% Description: Select data by time
% Input:  data = table [row time column1 column3 ...]
%         time_start: start time,if time_start equal 1
%         time_stop : end time
% Output: result = data[time_start:time_stop,:]


[temp row_start] = min(abs(data.time - time_start));
[temp row_stop] = min(abs(data.time - time_stop));

if (row_start < row_stop || row_start == row_stop)
    result = data(row_start:row_stop,:);
else
    disp('Err: row_start > row_stop');
    result = data;
end


end
function result = Synchronization_time(time,fitting_data)
% Description: Synchronization time and data
% Input:  time: reference data time
%         fitting_data: Data that need to be synchronized   [time2 column_1 column_2 ...]
% Output: result = [time column1 column2 ... ]

    %% Process time
    % reference time
    time(:,2) = [1;diff(time)];
    time(:,3) = ones(size(time,1),1);
    for i = 1:size(time,1)
        if (time(i,2) < 0 || time(i,2) == 0)
            time(i,3) = 0;
        end
    end
    ind = logical(time(:,3));
    time = time(ind,1);


    % fitting data time
    fitting_time = fitting_data(:,1);
    fitting_time(:,2) = [1;diff(fitting_time)];
    fitting_time(:,3) = ones(size(fitting_time,1),1);
    for i = 1:size(fitting_time,1)
        if (fitting_time(i,2) < 0 || fitting_time(i,2) == 0)
            fitting_time(i,3) = 0;
        end
    end
    ind = logical(fitting_time(:,3));
    fitting_data = fitting_data(ind,:);


    %%

    result = time;
    % result data column
    column_result = 2;
    for i = 2:size(fitting_data,2)
        result(:,column_result) = interp1(fitting_data(:,1),fitting_data(:,i),time,'linear','extrap');
        column_result = column_result + 1;
    end



end
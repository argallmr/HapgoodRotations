%--------------------------------------------------------------------------
% Name
%   sun_mean_longiude
%
% Purpose
%   Compute the sun's mean longiude.
%
%   Note:
%   Strictly speaking, TDT (Terrestrial Dynamical Time) should be used
%   here in place of UTC, but the difference of about a minute gives a
%   difference of about 0.0007� in lambdaSun.
%
%   Calling Sequence:
%   lambda = sun_mean_anomaly(T0, UTC)
%   Compute the sun's mean longitude (degrees) given the number
%   of julian centuries (T0) from 2000-01-01T12:00:00Z until
%   00:00 UTC on the day of interest, and Universal Time (UTC) in
%   decimal hours.
%
% Inputs
%   T0:     in, required, type = double
%           Time in Julian centuries calculated from 2000-01-01T12:00:00Z
%           (known as Epoch 2000) to the previous midnight. It is computed as
%             T0 = (MJD - 51544.5) / 36525.0
%   UTC:    in, required, type = double
%
%
% Returns
%   LAMBDA: out, required, type = double
%           Mean longitude of the sun, in degrees.
%
% References:
%   See Hapgood Rotations Glossary.txt.
%   - https://www.spenvis.oma.be/help/background/coortran/coortran.html
%   - Hapgood, M. A. (1992). Space physics coordinate transformations:
%     A user guide. Planetary and Space Science, 40 (5), 711?717.
%     doi:http://dx.doi.org/10.1016/0032-0633 (92)90012-D
%   - Hapgood, M. A. (1997). Corrigendum. Planetary and Space Science,
%     45 (8), 1047 ?. doi:http://dx.doi.org/10.1016/S0032-0633 (97)80261-9
%
% Last update: 2014-10-14
% MATLAB release(s) MATLAB 7.12 (R2011a), 8.3.0.532 (R2014a)
% Required Products None
%--------------------------------------------------------------------------
function lambda = sun_mean_longitude(T0, UTC)
	assert (nargin > 1, 'Usage: LAMBDA = sun_mean_longitude(T0, UTC)');

	% Sun's Mean anomaly
	%   - Force to the range [0, 360)
	lambda = mod (280.460 + 36000.772 * T0 + 0.04107 * UTC, 360);
end
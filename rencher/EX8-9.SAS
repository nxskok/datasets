/*EXAMPLE 8.9 */

DATA HELMET;
  INFILE 'T8_3_FOOTBALL.dat';
  INPUT GROUP WDIM CIRCUM FBEYE EYEHD EARHD JAW;
PROC STEPDISC STEPWISE SIMPLE STDMEAN TCORR WCORR;
  CLASS GROUP;
  TITLE 'EXAMPLE 8.9 STEPWISE';
ENDSAS;
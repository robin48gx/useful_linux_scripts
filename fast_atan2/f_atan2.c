#include <stdio.h>
#include <math.h>

#define PI 3.14159265358979323844

double angle;
double coeff_1 = PI/4.0;
double coeff_2 = 3.0*(PI/4.0);
double abs_y;

//-----------------------------------------------
// Fast arctan2
double arctan2(double y, double x)
{
	double r;
   //coeff_1 = pi/4;
   //coeff_2 = 3*coeff_1;
   abs_y = fabs(y)+1e-10;      // kludge to prevent 0/0 condition
   if (x>=0)
   {
      r = (x - abs_y) / (x + abs_y);
      angle = coeff_1 - coeff_1 * r;
   }
   else
   {
      r = (x + abs_y) / (abs_y - x);
      angle = coeff_2 - coeff_1 * r;
   }
   if (y < 0)
   return(-angle);     // negate if in quad III or IV
   else
   return(angle);
}



int main() {
 double x,y,mag;
 printf("#\n#\n#1   2       3  4        5   6        7      8          9        10         11   12        13       14 \n#\n");

	for (x=-2.0;x<=2.0;x+=0.001) {
		for(y=-2.0;y<=2.0;y+=0.001) {
			mag  = sqrt(x*x+y*y);
			if ( mag < 1.6 && mag > 1.4 ) {
			printf ( " x %f y %f mag %f atan2 %f arctan2 %f diff %f diffdeg %f\n",
					x,
					y,
					sqrt(x*x+y*y),
					atan2(y,x) * 360.0/(2*PI) ,
				       	arctan2(y,x) * 360.0/(2*PI) ,
				       	atan2(y,x) - arctan2(y,x),
			                360.0/(2*PI) * (atan2(y,x) - arctan2(y,x) )
					);

		}
		}
	}
	return 0;
}

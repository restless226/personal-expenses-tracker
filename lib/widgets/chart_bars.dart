import 'package:flutter/material.dart';

class ChartBar extends StatelessWidget {

  final String label;
  final double spendingAmount;
  final double spendingPctOfTotal;

  ChartBar(this.label,this.spendingAmount,this.spendingPctOfTotal);

  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(builder: (ctx,constraint){
        return  Column(
          children: [
            Container(
              height: constraint.maxHeight*0.2,
              child: FittedBox(
                  child: Text(
                      '\$${spendingAmount.toStringAsFixed(0)}',
                      style: TextStyle(
                          fontWeight: FontWeight.bold,
                          fontFamily:'OpenSans'
                              '')
                  )
              ),
            ),

            SizedBox(height: constraint.maxHeight*0.05,),

            Container(
              height: constraint.maxHeight*0.5,
              width: 10,
              child: Stack(
                children: [
                  Container(
                    decoration: BoxDecoration(
                      border: Border.all(color: Colors.grey,width: 1),
                      color: Colors.white60,
                      borderRadius: BorderRadius.circular(20),
                    ),
                  ),

                  FractionallySizedBox(
                    heightFactor: spendingPctOfTotal,
                    child: Container(
                      decoration:BoxDecoration(
                        color: Theme.of(context).primaryColor,
                        borderRadius: BorderRadius.circular(20),
                      ) ,
                    ),
                  ),

                ],
              ),
            ),

            SizedBox(height: constraint.maxHeight*0.05,),

            Container(
              height: constraint.maxHeight*0.20,
                child: FittedBox(
                  child: Text(
                    label,
                    style: TextStyle(
                        fontWeight: FontWeight.bold,
                        fontFamily:'OpenSans'
                    ),
                  ),
                )
            ),

          ],
        );
      },
    );
  }
}

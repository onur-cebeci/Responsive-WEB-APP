import 'package:company_web_app/screens/witgets/custom_clip_path.dart';
import 'package:flutter/material.dart';

class MobileCustomListViewWidget extends StatefulWidget {
  const MobileCustomListViewWidget({
    Key? key,
    required this.size,
    required this.pageController,
  }) : super(key: key);

  final Size size;
  final PageController pageController;

  @override
  State<MobileCustomListViewWidget> createState() =>
      _MobileCustomListViewWidgetState();
}

class _MobileCustomListViewWidgetState
    extends State<MobileCustomListViewWidget> {
  @override
  Widget build(BuildContext context) {
    double width = widget.size.width > 1000
        ? widget.size.width / 5.5
        : widget.size.width / 1.324;
    return ClipPath(
      clipper: CustomClipPath(),
      child: Row(
        children: [
          MaterialButton(
            height: widget.size.height / 2.45,
            minWidth: widget.size.width / 8.2,
            onPressed: () {
              setState(() {
                widget.pageController.animateToPage(
                    widget.pageController.page!.toInt() - 1,
                    duration: const Duration(milliseconds: 600),
                    curve: Curves.easeInOut);
              });
            },
            color: Colors.blue,
          ),
          Expanded(
            child: Container(
              color: Colors.transparent,
              height: widget.size.height / 2.5,
              width: widget.size.width,
              child: ListView(
                physics: const PageScrollPhysics(),
                controller: widget.pageController,
                scrollDirection: Axis.horizontal,
                children: [
                  CustomListContainer(
                    size: widget.size,
                    width: width,
                    image:
                        'https://images.pexels.com/photos/224924/pexels-photo-224924.jpeg?auto=compress&cs=tinysrgb&w=1260&h=750&dpr=1',
                  ),
                  CustomListContainer(
                    size: widget.size,
                    width: width,
                    image:
                        'https://images.pexels.com/photos/356043/pexels-photo-356043.jpeg?auto=compress&cs=tinysrgb&w=1260&h=750&dpr=1',
                  ),
                  CustomListContainer(
                    size: widget.size,
                    width: width,
                    image:
                        'https://images.pexels.com/photos/699459/pexels-photo-699459.jpeg?auto=compress&cs=tinysrgb&w=1600',
                  ),
                  CustomListContainer(
                    size: widget.size,
                    width: width,
                    image:
                        'https://images.pexels.com/photos/3861976/pexels-photo-3861976.jpeg?auto=compress&cs=tinysrgb&w=1260&h=750&dpr=1',
                  ),
                  CustomListContainer(
                    size: widget.size,
                    width: width,
                    image:
                        'https://images.pexels.com/photos/3184292/pexels-photo-3184292.jpeg?auto=compress&cs=tinysrgb&w=1600',
                  ),
                  CustomListContainer(
                    size: widget.size,
                    width: width,
                    image:
                        'https://images.pexels.com/photos/730547/pexels-photo-730547.jpeg?auto=compress&cs=tinysrgb&w=1600',
                  ),
                ],
              ),
            ),
          ),
          MaterialButton(
            height: widget.size.height / 2.45,
            minWidth: widget.size.width / 8.2,
            onPressed: () {
              setState(() {
                widget.pageController.animateToPage(
                    widget.pageController.page!.toInt() + 1,
                    duration: const Duration(milliseconds: 600),
                    curve: Curves.easeInQuad);
              });
            },
            color: Colors.blue.withOpacity(0.7),
          ),
        ],
      ),
    );
  }
}

class CustomListContainer extends StatelessWidget {
  const CustomListContainer({
    Key? key,
    required this.width,
    required this.image,
    required this.size,
  }) : super(key: key);
  final Size size;
  final double width;
  final String image;
  @override
  Widget build(BuildContext context) {
    return Stack(
      alignment: Alignment.center,
      children: [
        SizedBox(
          height: size.height / 2.5,
          width: width,
          child: Image.network(
            image,
            fit: BoxFit.cover,
          ),
        ),
        Container(
          width: width,
          decoration: BoxDecoration(
            boxShadow: [
              BoxShadow(
                color: Colors.black.withOpacity(0.2),
              ),
            ],
          ),
        ),
        SizedBox(
          height: 70,
          child: TextButton(
            onPressed: () {},
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              mainAxisAlignment: MainAxisAlignment.center,
              children: const [
                Text(
                  'Lorem Lipsum',
                  style: TextStyle(color: Colors.white70, fontSize: 20),
                ),
                Icon(
                  Icons.forward,
                  color: Colors.white70,
                  size: 24,
                ),
              ],
            ),
          ),
        ),
      ],
    );
  }
}

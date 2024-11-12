import 'package:ai_image/core/core.dart';
import 'package:ai_image/feature/prompt/ui/bloc/prompt_bloc.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class CreatePromptScreen extends StatefulWidget {
  const CreatePromptScreen({super.key});

  @override
  State<CreatePromptScreen> createState() => _CreatePromptScreenState();
}

class _CreatePromptScreenState extends State<CreatePromptScreen> {
  TextEditingController controller = TextEditingController();
  final PromptBloc promptBloc = PromptBloc();

  @override
  void initState() {
    promptBloc.add(PromptInitialEvent());
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("PixieAI", style: font_1_4W()),
        centerTitle: true,
        backgroundColor: preblack,
        leading: Padding(
          padding: const EdgeInsets.only(left: 10),
          child: GestureDetector(
            child: CircleAvatar(
              backgroundColor: preblack,
              child: Image.asset(
                "assets/icon.jpg",
                fit: BoxFit.cover,
              ),
            ),
            onTap: () {},
          ),
        ),
      ),
      body: BlocConsumer<PromptBloc, PromptState>(
        bloc: promptBloc,
        listener: (context, state) {},
        builder: (context, state) {
          switch (state.runtimeType) {
           case PromptGeneratingImageLoadState:
              return Center(child: CircularProgressIndicator());
      
             case PromptGeneratingImageErrorState:
              return Center(child: Text("Something went wrong"));
      
            case PromptGeneratingImageSuccessState:
      
               final successState = state as PromptGeneratingImageSuccessState;
              return Column(
                children: [
                  Expanded(
                    child: Container(
                      width: double.maxFinite,
                      height: 400,
                      decoration: BoxDecoration(
                        image: DecorationImage(
                          fit: BoxFit.cover,
                            image: MemoryImage(successState.uint8listu)),
                      ),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: ClipRRect(
                      borderRadius: BorderRadius.circular(35.0),
                      child: Material(
                        elevation: 7.0,
                        borderRadius: BorderRadius.circular(35.0),
                        child: Container(
                          decoration: BoxDecoration(
                            color: preblack,
                            borderRadius: BorderRadius.circular(35.0),
                            border: Border.all(
                              color: Color.fromARGB(255, 70, 158, 230),
                              width: 1.0,
                            ),
                          ),
                          padding: const EdgeInsets.all(5),
                          child: Row(
                            children: [
                              Expanded(
                                child: Container(
                                  padding: const EdgeInsets.only(right: 10.0),
                                  child: TextField(
                                    controller: controller,
                                    maxLines: null,
                                    cursorColor: Color.fromARGB(255, 70, 158, 230),
                                    decoration: const InputDecoration(
                                      hintText: "Enter your prompt here...",
                                      hintStyle: TextStyle(color: Color.fromARGB(255, 70, 158, 230)),
                                      border: InputBorder.none,
                                      focusedBorder: InputBorder.none,
                                      contentPadding: EdgeInsets.all(12.0),
                                    ),
                                  ),
                                ),
                              ),
                              // Send button
                              InkWell(
                                onTap: () {
                                  if(controller.text.isNotEmpty){
                                    promptBloc.add(PromptEnteredEvent(prompt: controller.text));
                                    controller.clear();
                                  }             
                                },
                                child: const CircleAvatar(
                                  radius: 28,
                                  backgroundColor: preblack,
                                  child: CircleAvatar(
                                    backgroundColor: Color.fromARGB(255, 70, 158, 230),
                                    radius: 27,
                                    child: Icon(Icons.send),
                                  ),
                                ),
                              ),
                            ],
                          ),
                        ),
                      ),
                    ),
                  )
                ],
              );
      
            default:
              return SizedBox(); 
          }
        },
      ),
    );
  }
}